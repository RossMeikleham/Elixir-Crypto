defmodule CryptoTest do
  use ExUnit.Case
  doctest Crypto

  import Crypto.Cast128

  use ExUnit.Case, async: true
  ExUnit.configure(timeout: :infinity)


  test '5 bit key' do
    key = 'testk'
    text ="fdsfgidusfgids"
    assert text == decryptHex(encryptHex(text, key), key)
  end

  test '6 bit key' do
    key = '578439'
    text = "how now brown cow"
    assert text == decryptHex(encryptHex(text, key), key)   
  end

  test '7 bit key' do
    key = 'test987'
    text = "random stuff entering blah blah"
    assert text == decryptHex(encryptHex(text, key), key)   
  end

  test '8 bit key' do
    key = 'mario85N'
    text = "some text is being encrypted here"
    assert text == decryptHex(encryptHex(text, key), key)   
  end

  test '9 bit key' do
    key = '8bit+1key'
    text = "This is some super secret text that no-one should read"
    assert text == decryptHex(encryptHex(text, key), key)   
  end

  test '10 bit key' do
    key = 'keyblade10'
    text = "AFGDUIFGDUISF&$*£$&*£$&*£(JHKFDFHDKNBFJDH@"
    assert text == decryptHex(encryptHex(text, key), key)    
  end

  test '11 bit key' do
    key = 'TurnItUp211'
    text = "You've met with a terrible fate, haven't you?"
    assert text == decryptHex(encryptHex(text, key), key)    
  end

  test '12 bit key' do
    key = 'TurnItUpTo12'
    text = "Running out of ideas of text to test"
    assert text == decryptHex(encryptHex(text, key), key)    
  end

  test '0 length text' do
    key = 'Whatever'
    text = ""
    assert text == decryptHex(encryptHex(text, key), key)     
  end

  test 'small text' do
    key = 'smalltxt'
    text = "some small text to encrypt"
    assert text == decryptHex(encryptHex(text, key), key)     
  end

  test 'medium text' do
    key = 'FULLMETAL'
    text = """
    This is my unit test, there are many like it but this one is mine.
    My unit test is my best friend, it is my life. I must master it as I
    as I master my life. Without me my unit test is buggy and useless. 
    Without my unit test ,I am useless. I must run my unit test true. I must 
    prevent the bugs that are trying to crash me. Before God I swear this creed.
    My unit test and myself are defenders of my program.
    """
    assert text == decryptHex(encryptHex(text, key), key)     
  end

  test 'large test' do
    key = 'thisisakey'
    text = case File.read("test/large.txt")  do
              {:ok, txt} -> txt
              {:error, reason} -> IO.puts "Error: #{reason}"
           end
    assert text == decryptHex(encryptHex(text, key), key)     
  end

  test 'huge test' do
    key ='alotoftext'
    text = case File.read('test/large.txt') do
              {:ok, txt} -> txt
              {:error, reason} -> IO.puts "Error: #{reason}"
           end
    assert text == decryptHex(encryptHex(text, key), key)     
  end
end

