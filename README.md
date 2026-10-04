<pre align="center">
  _       _               _    _
  /_\   __| |_ ___ _ _ ___(_)__| |
 / _ \ (_-<  _/ -_) '_/ _ \ / _` |
/_/ \_\/__/\__\___|_| \___/_\__,_|
\ \    / /_ _ _  _
 \ \/\/ / _` | || |
  \_/\_/\__,_|\_, |
              |__/
</pre>

Asteroid Way is a 16-bit x86 arcade game written entirely in Assembly for DOS. It renders directly to VGA mode 13h (`320x200`, 256 colors), uses BIOS interrupts for keyboard input and timing, and implements its sprites as byte-based pixel maps in the data segment.

The player controls a ship traveling through an asteroid field. Asteroids become faster as levels progress, while life and shield pickups provide temporary assistance. The ship wins after reaching level 6 and loses when its health bar is depleted. A time bar tracks level progression, and all pseudorandom spawn positions are derived from the system clock.

## Controls

| Context | Key | Action |
| --- | --- | --- |
| Menu | Up/Down arrows | Change the selected option |
| Menu | Enter | Confirm the selected option |
| Game | Up arrow | Move the ship upward |
| Game | Down arrow | Move the ship downward |
| Game | Space | Fire a projectile |

## Requirements

- An 8086-compatible DOS environment or emulator
- An assembler that accepts emu8086-compatible MASM syntax
- emu8086 is recommended for compiling, emulating, and debugging the program step by step
- GUI Turbo Assembler can be used to compile and run the game in a DOS-compatible environment

## Build and run

### Debugging with emu8086

1. Open `src/astway.asm`.
2. Select **Compile**.
3. Select **Emulate** after compilation succeeds.
4. Use the emulator controls to run the program continuously or inspect it instruction by instruction.

### Running with GUI Turbo Assembler

1. Open `src/astway.asm` in GUI Turbo Assembler.
2. Assemble and link the source file.
3. Run the generated executable from its DOS-compatible environment.

The generated executable targets 16-bit DOS and cannot run directly as a native modern Windows, Linux, or macOS application. It must run inside an 8086/DOS-compatible environment.

## License

This project is licensed under the [MIT License](LICENSE).
