type ObjectType<T> = Record<string, T>;

export const removeUnderscoresWithNumbers = <T>(obj: T): T => {
  if (typeof obj !== 'object' || obj === null) {
    return obj;
  }
  if (Array.isArray(obj)) {
    const arr = obj as T[];
    return arr.map((item) => removeUnderscoresWithNumbers(item)) as T;
  }

  if (typeof obj === 'object') {
    const newObj: ObjectType<T> = {};
    for (const key in obj) {
      if (Object.prototype.hasOwnProperty.call(obj, key)) {
        const newKey = key.replace(/_([0-9]+)/g, '$1');
        newObj[newKey] = removeUnderscoresWithNumbers(obj[key]) as T;
      }
    }
    return newObj as T;
  }
  return obj;
};
