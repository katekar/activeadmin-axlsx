module ActiveAdmin
  module Axlsx
    module DSL
      delegate :ingnore_columns, :column, :after_filer, :i18n_scope, :header_style, :skip_header, :white_list, to: :xlsx_builder, prefix: :config
      # @see ActiveAdmin::Axlsx::Builder
      def xlsx(options={}, &block)
        return unless ActiveRecord::Base.connection.table_exists? config.resource_class.table_name
        config.xlsx_builder = ActiveAdmin::Axlsx::Builder.new(config.resource_class, options, &block)
      end
    end
  end
end

