#![no_std] // Disable the standard library
#![no_main] // Disable the standard main function

use core::panic::PanicInfo;

/// This function is called on panic.
#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

/// The entry point for the OS.
#[no_mangle]
pub extern "C" fn _start() -> ! {
    // Call the function to print "Hello, World!"
    print_hello_world();

    loop {}
}

/// Function to print "Hello, World!" to the VGA buffer.
fn print_hello_world() {
    let vga_buffer = 0xb8000 as *mut u8; // VGA buffer starts at 0xB8000

    // Write "Hello, World!" to the VGA buffer
    let message = b"Hello, World!";
    for (i, &byte) in message.iter().enumerate() {
        unsafe {
            *vga_buffer.offset(i as isize * 2) = byte; // Character
            *vga_buffer.offset(i as isize * 2 + 1) = 0x0F; // Attribute (white on black)
        }
    }
}