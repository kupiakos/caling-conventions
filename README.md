
This is an example of the difference in calling conventions on Windows/Linux, and on x86/x64.

The primary calling conventions that are seen are:

 - `cdecl`, the most popular. The callee is responsible for stack cleanup.
 - `stdcall`, used for all of the Windows API. The caller is responsible for stack cleanup.
 - `fastcall`, a method of calling used on Windows.
 - `64-bit call` (unknown), used for calling all 64-bit functions on Windows?

Run `make` to cross-compile all demo binaries to mess around with.

