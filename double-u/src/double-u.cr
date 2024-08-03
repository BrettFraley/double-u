# TODO: Write documentation for `Double::U`
module Double::U
  VERSION = "0.1.0"

  
    # Experiments with task and function definitions from 'W' grammer
     
    macro define_writer(name, format_type, data, destination)
        def {{name}}
            data = {{content}}
            format_type = {{ format_type }}
            destination = {{ destination }}
        end
    end

    define_writer write_file, format 

    ######################################################

    macro define_method(name, content)
        def {{name}}
            {% if content == 1 %}
                "one"
            {% elsif content == 2 %}
                "two"
            {% else %}
                {{content}}
            {% end %}
        end
    end




end
