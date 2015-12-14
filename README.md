# Elixir Crypto

Cryptographic Algorithms implemented in Elixir

> ***note**** Don't use any of these implementations for any important
data you want to encrypt.

[![Build Status](https://travis-ci.org/RossMeikleham/Elixir-Crypto.svg)](https://travis-ci.org/RossMeikleham/Elixir-Crypto)

# Algorithms Implemented

## CAST-128
Implements CAST-128 algorithm defined in [RFC2144](https://tools.ietf.org/html/rfc2144) with
[PKCS5](http://www.herongyang.com/Cryptography/DES-JDK-What-Is-PKCS5Padding.html) padding.

## Example
```elixir
ie> c("cast-128.ex")
ie> c = Crypto.Cast128.encryptHex("hello world", 'password') 
"5EC39CC2BDC28EC3AAC3BFC3AEC2892FC3B3C388C29C544B2AC29D"
ie> Crypto.Cast128.decryptHex(c, 'password')
"hello world"
```
