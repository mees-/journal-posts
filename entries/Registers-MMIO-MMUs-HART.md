---
title: Registers, MMIO, MMUs and a HART
location: Home, Groningen
date: 2022-04-20T10:42
---

Well first of all, it's been a while and I very much wasn't sure whether I would
ever write another entry. But I've found something very interesting on Reddit.

Yesterday morning I woke up in the house of one of my friend's parents. We had
had a party the night before and slept over, since it's far away from where I
live. As I was scrolling Reddit early in the morning I came across a post
mentioning
[someone's blog about building an OS in Rust for the RISC-V architecture](https://osblog.stephenmarz.com/index.html).
I've been playing with my Arduino a little bit lately and I had also already
come across a project that simplifies Rust development on Arduino. I learned to
program the Arduino in C (not the official Arduino C++ suite) in college two
years ago so I already knew a bit about bare metal programming. RISC-V was no
Arduino however, this was a much more complicated instruction set architecture
(ISA) than the one that my Arduino runs. My Arduino, which is an Uno Rev3 runs
on an Atmega328p processor. That chip contains the flash (for storing the
program), eeprom (a sort of non-volatile RAM) and it's SRAM (actual RAM) all on
the same chip as it's processor core. This is what's known as a
[System on a Chip (SoC)](https://en.wikipedia.org/wiki/System_on_a_chip) and it
combines some parts of a computer all in one chip. The Arduino actually also has
a whole other SoC, an Atmega16u2, as a co-processor which acts as a converter
between the serial interface and USB, basically it handles all USB things.

RISC-V is a lot more complicated than this, while also being a good stepping
stone to keep learning more about hardware. RISC-V uses, like Atmel's AVR, a
[Reduced Instruction Set Computing](https://en.wikipedia.org/wiki/Reduced_instruction_set_computer)
ISA. Which means that instead of thousands of instructions for the CPU, it has a
couple hundred. RISC-V supports a lot more than AVR though. To me, as a relative
noob (who hasn't even completed that blog series yet), it seems one of the
important differences between the two is the fact that RISC-V has an
unprivileged mode. That means that the CPU can block or alter some of it's
behaviour when foreign programs are running. Exactly like how some program I
download on my laptop can't just go and modify my entire computer and hack me.
Granted you can get hacked, but a program can't _just_ do it. The Arduino
doesn't have that and that's why writing an OS on an Arduino isn't as
spectacular. Because you need to trust all the software you put on it with the
whole machine, you might as well write specialised software that skips having a
kernel and OS at all.

All in all I'm learning a lot about the RISC-V architecture and how kernel and
OS development works. I'm planning to practice some of it too. I'll probably do
it on my Arduino, even though it isn't really useful (as described above). I've
been interested in systems development for some time but the blog post series is
a really good kick start to learn a lot more.  
If I do end up writing an OS for the Arduino, I'll write another entry about it.

For a short explanation of the title, MMIO is memory-mapped IO, the MMU is the
memory management unit, which protects the RAM from unauthorized programs and a
HART is a hardware thread AKA processor core.

## More interesting links

I've been researching a lot of stuff related to these topics. If you're
interested, click some of the links!

- [The blog again](https://osblog.stephenmarz.com/index.html)
- [Arduino](https://www.Arduino.cc/)
- [Awesome Embedded Rust](https://github.com/rust-embedded/awesome-embedded-rust)
- [RISC-V technical specification](https://riscv.org/technical/specifications/)
