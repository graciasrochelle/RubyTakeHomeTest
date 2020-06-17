require 'csv'
module ReadCsvFile
    def convertfiletonestedhash(file)
        nested_hash = Hash.new(Hash.new())
        begin
            file_path = File.expand_path("data/" + file + ".csv")
            CSV.foreach(file_path, headers: true, :header_converters => :symbol, :converters => :all) do |row|
                key = row.fields[2]
                value = {}
                if nested_hash.key?(key)
                    value = nested_hash.fetch(key)
                    value[row.fields[0]] = Hash[row.headers[1..-2].zip(row.fields[1..-2])] 
                    nested_hash[key] = value
                else
                    value[row.fields[0]] = Hash[row.headers[1..-2].zip(row.fields[1..-2])] 
                    nested_hash[key] = value
                end
            end    
        rescue Errno::ENOENT => e
            $stderr.puts "Caught the exception: #{e}"
            exit -1
        end
        puts "File: " + file + " successfully loaded."
        return nested_hash
    end

    def convertCSVtohash(file)
        hash = Hash.new()
        begin
            file_path = File.expand_path("data/" + file + ".csv")
            CSV.foreach(file_path, headers: true, :header_converters => :symbol, :converters => :all) do |row|
                hash[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
            end    
        rescue Errno::ENOENT => e
            $stderr.puts "Caught the exception: #{e}"
            exit -1
        end
        puts "File: " + file + " successfully loaded."
        return hash
    end
end