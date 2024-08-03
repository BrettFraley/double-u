Nested macros¶
It is possible to define a macro which generates one or more macro definitions. You must escape macro expressions of the inner macro by preceding them with a backslash character "\" to prevent them from being evaluated by the outer macro.

macro define_macros(*names)
  {% for name in names %}
    macro greeting_for_{{name.id}}(greeting)
      \{% if greeting == "hola" %}
        "¡hola {{name.id}}!"
      \{% else %}
        "\{{greeting.id}} {{name.id}}"
      \{% end %}
    end
  {% end %}
end

# This generates:
#
#     macro greeting_for_alice(greeting)
#       {% if greeting == "hola" %}
#         "¡hola alice!"
#       {% else %}
#         "{{greeting.id}} alice"
#       {% end %}
#     end
#     macro greeting_for_bob(greeting)
#       {% if greeting == "hola" %}
#         "¡hola bob!"
#       {% else %}
#         "{{greeting.id}} bob"
#       {% end %}
#     end
define_macros alice, bob

greeting_for_alice "hello" # => "hello alice"
greeting_for_bob "hallo"   # => "hallo bob"
greeting_for_alice "hej"   # => "hej alice"
greeting_for_bob "hola"    # => "¡hola bob!"
verbatim¶
Another way to define a nested macro is by using the special verbatim call. Using this you will not be able to use any variable interpolation but will not need to escape the inner macro characters.

macro define_macros(*names)
  {% for name in names %}
    macro greeting_for_{{name.id}}(greeting)

      # name will not be available within the verbatim block
      \{% name = {{name.stringify}} %}

      {% verbatim do %}
        {% if greeting == "hola" %}
          "¡hola {{name.id}}!"
        {% else %}
          "{{greeting.id}} {{name.id}}"
        {% end %}
      {% end %}
    end
  {% end %}
end

# This generates:
#
#     macro greeting_for_alice(greeting)
#       {% name = "alice" %}
#       {% if greeting == "hola" %}
#         "¡hola {{name.id}}!"
#       {% else %}
#         "{{greeting.id}} {{name.id}}"
#       {% end %}
#     end
#     macro greeting_for_bob(greeting)
#       {% name = "bob" %}
#       {% if greeting == "hola" %}
#         "¡hola {{name.id}}!"
#       {% else %}
#         "{{greeting.id}} {{name.id}}"
#       {% end %}
#     end
define_macros alice, bob

greeting_for_alice "hello" # => "hello alice"
greeting_for_bob "hallo"   # => "hallo bob"
greeting_for_alice "hej"   # => "hej alice"
greeting_for_bob "hola"    # => "¡hola bob!"
