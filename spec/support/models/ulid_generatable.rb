# frozen_string_literal: true

require 'rails_helper'

shared_examples_for 'UlidGeneratable' do
  describe '#primary_key' do
    context 'when primary_key column is `id`' do
      subject { described_class.new.id }

      id { is_expected.to match(/[0-9A-Z]{26}/) }
    end
  end
end