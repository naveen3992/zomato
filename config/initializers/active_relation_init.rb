class ActiveRecord::Relation
  def exec_queries
    return @records if loaded?

    default_scoped = with_default_scope

    if default_scoped.equal?(self)
      @records = if @readonly_value.nil? && !@klass.locking_enabled?
                   eager_loading? ? find_with_associations : @klass.find_by_sql(arel, @bind_values)
                 else
                   IdentityMap.without do
                     eager_loading? ? find_with_associations : @klass.find_by_sql(arel, @bind_values)
                   end
                 end

      preload = @preload_values
      preload +=  @includes_values unless eager_loading?
      preload.each do |associations|
        ActiveRecord::Associations::Preloader.new(@records, associations).run
      end

      # @readonly_value is true only if set explicitly. @implicit_readonly is true if there
      # are JOINS and no explicit SELECT.
      readonly = @readonly_value.nil? ? @implicit_readonly : @readonly_value
      @records.each { |record| record.readonly! } if readonly
    else
      @records = default_scoped.to_a
    end

    @loaded = true
    @records
  end
end