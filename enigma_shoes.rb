require './enigma'

Shoes.app do
  background "#A61606"
  border("#ED1E03",
              strokewidth: 10)
  title("Welcome to Enigma",
          top: 10,
          align: "center",
          font: "Trebuchet MS",
          stroke: black)
  stack(margin: 100) {
    flow do
      @encrypt = button "Encrypt"
      @encrypt.click {
        stack(margin: 100) {
          flow do
            @encrypt_message_message = para "Enter message to be encrypted:"
            @message_to_be_encrypted = edit_line
            @encrypt_message_button = button "Encrypt Message"
          end
          flow do
            @encryption_key_message = para "Enter 5-digit key to encrypt with:"
            @encryption_key_to_be_used = edit_line
          end
        }
      }
    end

    flow do
      @decrypt = button "Decrypt"
    end

    flow do
      @cracker = button "Crack"
    end
  }

  @encrypt_message_button.click {
    e.encrypt(@message_to_be_encrypted.text, @encryption_key_to_be_used.text)
    para @tester.text
  }

e = Enigma.new

end
