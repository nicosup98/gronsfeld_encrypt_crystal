require "./gronsfeld"
require "clicr"
Clicr.new(
  label: "gronsfeld",
  description: "Codifica y decodifica texto utilizando el método Gronsfeld",
  commands: {
    encode: {
      label:     "encode with gronsfeld",
      action:    {"CLI.encode": "e"},
      arguments: %w(text),
      options:   {
        key: {
          label:   "secret key",
          default: "1234",
        },
      },
    },
    decode: {
      label:     "decode with gronsfeld",
      action:    {"CLI.decode": "d"},
      arguments: %w(text),
      options:   {
        key: {
          label:   "secret key",
          default: "1234",
        },
      },
    },
  }
).run

module CLI
  def self.encode(arguments, key)
    puts Gronsfeld.codificar(arguments[0], key)
  end

  def self.decode(arguments, key)
    puts Gronsfeld.decodificar(arguments[0], key)
  end
end

