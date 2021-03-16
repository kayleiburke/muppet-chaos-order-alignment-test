class ObjectCreator
  def perform(object_name)
    file_path = "csvs/#{object_name.underscore.pluralize}.csv"
    csv_hash = CSV.read(file_path, headers: true).map {|row| row.to_hash.transform_keys(&:to_sym) }
    create_objects(object_name, csv_hash)
  end

  private

  def create_objects(object_name, input_list)
    arr = []
    input_list.each do |input|
      arr.push(create_object(object_name, input))
    end
    arr
  end

  def create_object(object_name, values)
    Kernel.const_get(object_name).new(values)
  end
end