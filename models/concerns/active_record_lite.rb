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

        vals.all? { |arg_val, record_val| arg_val.to_s == record_val.to_s } # Returns true/false
      end
    end

    def in(**args)
      # Only select records, where the value I pass in matches value of record
      all.select do |record|

        # Returns array of arrays [ ["1", choice.question_id], [ "4", choice.id ] ]
        vals = args.map { |k, v| [v, record.send(k)] }

        # Choice.in(question_id: question_ids)
        # vals = [ [[1, 2, ...], "choice.question_id"] ]
        # arg_values.include?(record_val)
        vals.all? { |arg_values, record_val| arg_values.include?(record_val) } # Returns true/false
      end
    end
  end

  module InstanceMethods

  end
end