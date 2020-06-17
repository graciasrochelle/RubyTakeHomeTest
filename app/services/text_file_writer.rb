class TextFileWriter
    def initialize(file_name, data)
        @file_name = file_name
        @data = data
    end

    def write()      
        begin
            file_path = File.expand_path("data/" +  @file_name + ".txt")
            file = File.open(file_path, "w")
            @data.each do |key, value|
                file.write(value.to_s) 
            end
        rescue IOError => e
            $stderr.puts "Caught the exception: #{e}"
        ensure
            file.close unless file.nil?
        end
    end
end