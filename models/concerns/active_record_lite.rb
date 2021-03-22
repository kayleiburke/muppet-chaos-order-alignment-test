module ActiveRecordLite
  module ClassMethods

    def all
      @all ||= ObjectCreator.new.perform(self.name) || []
    end

    def where(**args)
      # Only select records, where the value I pass in matches value of record
      all.select do |record|

        # Returns array of arrays [ ["1", choice.question_id], [ "4", choice.id ] ]
        vals = args.map { |k, v| [v, record.send(k)] }

        vals.all? { |arg_val, record_val| arg_val == record_val } # Returns true/false
      end
    end
  end

  module InstanceMethods

  end
end