require 'mongoid'
require 'mongoid-settings/version'

module Mongoid
  module Settings
    extend ActiveSupport::Concern

    class Storage
      include Mongoid::Document
      store_in(collection: 'settings')
    end

    module ClassMethods
      def [](name)
        storage[name].presence || defaults[name]
      end

      def []= (name, value)
        storage.update_attribute(name, value) if defaults.include?(name)
      end

      def reload!
        @storage = load_storage
      end

      private

      def setting(name, options = {})
        Storage.class_eval do
          field(name, options)
        end
        defaults[name] = options[:default]
        define_singleton_method(name) { self[name] }
        define_singleton_method("#{name}=") { |value| self[name] = value }
      end

      def defaults
        @defaults ||= {}
      end

      def storage
        @storage ||= load_storage
      end

      def load_storage
        Storage.first_or_create
      end
    end
  end
end
