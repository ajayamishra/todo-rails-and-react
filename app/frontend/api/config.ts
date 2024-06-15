import Axios, { AxiosRequestConfig } from 'axios';
import { objectToSnake, objectToCamel } from 'ts-case-convert';
import { removeUnderscoresWithNumbers } from '@/utils/removeUnderscoreWithNumbers';

const AXIOS_INSTANCE = Axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL,
  headers: {
    ['Content-Type']: 'application/json',
  },
  withCredentials: true,
  xsrfCookieName: 'XSRF-TOKEN',
  xsrfHeaderName: 'X-CSRF-TOKEN',
});

AXIOS_INSTANCE.interceptors.request.use((req) => {
  req.data = removeUnderscoresWithNumbers(objectToSnake(req.data));
  req.params = removeUnderscoresWithNumbers(objectToSnake(req.params));
  return req;
});

AXIOS_INSTANCE.interceptors.response.use((res) => {
  res.data = objectToCamel(res.data);
  return res;
});

export const axiosInstance = <T>(config: AxiosRequestConfig): Promise<T> => {
  const source = Axios.CancelToken.source();
  const promise = AXIOS_INSTANCE({
    ...config,
    cancelToken: source.token,
    headers: { ...config.headers, Accept: 'application/json' },
  }).then(({ data }) => objectToCamel(data) as T);

  // eslint-disable-next-line @typescript-eslint/ban-ts-comment
  // @ts-ignore
  promise.cancel = () => {
    source.cancel('Query was cancelled');
  };

  return promise;
};
