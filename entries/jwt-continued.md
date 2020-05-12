---
title: JWT continued
date: 2020-05-12T10:45
location: Home, Groningen
---

So recently I made my [JWT service](https://github.com/mees-/jwt-service). It's
working and nice but I realised this is not "it". When I started making the JWT
service I didn't really know what jwt was and how it worked. I had sufficient
understanding of cryptography to know what hashes and signatures were and I also
knew the difference between symmetric encryption and asymmetric encryption.

What I thought though, is that JWT uses one single authoritative server to check
tokens. This way, every time someone wants to verify a JWT they would need to
make another request to the authoritative server to verify the token. A much
better solution to this problem is signing the token with an asymmetric key.
That way you can distribute your public key to everyone that wants to verify
tokens and sign the tokens themselves with your private key. This way JWTs can
really replace or enhance things like Oauth that use third-party authentication
providers.

What I realised then, is that my JWT service, which uses the HMAC algorithm to
sign the tokens, isn't that great to use as a microservice. A good way to
improve it would be to have it use an asymmetric key so that other servers can
verify the tokens without having to make that extra request.

For the goals that I had in mind though, which were to use it for a single
application, the best way would probably be to keep the jwt parts and the rest
of the server together, which allows it to use HMAC and gain the performance
benefits that come with it.
