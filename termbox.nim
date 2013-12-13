when defined(Linux):
  const LibName = "libtermbox.so"
else:
  {.error: "This platform has not been accounted for in the termbox wrapper.".}

# --------------- keys ----------------
# These are safe subset of terminfo keys, which exists on all popular terminals.
#   I think it's important to use only these and not others.
#
const
  TB_KEY_F1* = 0x0000FFFF'u16
  TB_KEY_F2* = 0x0000FFFE'u16
  TB_KEY_F3* = 0x0000FFFD'u16
  TB_KEY_F4* = 0x0000FFFC'u16
  TB_KEY_F5* = 0x0000FFFB'u16
  TB_KEY_F6* = 0x0000FFFA'u16
  TB_KEY_F7* = 0x0000FFF9'u16
  TB_KEY_F8* = 0x0000FFF8'u16
  TB_KEY_F9* = 0x0000FFF7'u16
  TB_KEY_F10* = 0x0000FFF6'u16
  TB_KEY_F11* = 0x0000FFF5'u16
  TB_KEY_F12* = 0x0000FFF4'u16
  TB_KEY_INSERT* = 0x0000FFF3'u16
  TB_KEY_DELETE* = 0x0000FFF2'u16
  TB_KEY_HOME* = 0x0000FFF1'u16
  TB_KEY_END* = 0x0000FFF0'u16
  TB_KEY_PGUP* = 0x0000FFEF'u16
  TB_KEY_PGDN* = 0x0000FFEE'u16
  TB_KEY_ARROW_UP* = 0x0000FFED'u16
  TB_KEY_ARROW_DOWN* = 0x0000FFEC'u16
  TB_KEY_ARROW_LEFT* = 0x0000FFEB'u16
  TB_KEY_ARROW_RIGHT* = 0x0000FFEA'u16
# These are all keys below SPACE character and BACKSPACE key
const
  TB_KEY_CTRL_TILDE* = 0x00000000'u16
  TB_KEY_CTRL_2* = 0x00000000'u16 # clash with 'CTRL_TILDE'
  TB_KEY_CTRL_A* = 0x00000001'u16
  TB_KEY_CTRL_B* = 0x00000002'u16
  TB_KEY_CTRL_C* = 0x00000003'u16
  TB_KEY_CTRL_D* = 0x00000004'u16
  TB_KEY_CTRL_E* = 0x00000005'u16
  TB_KEY_CTRL_F* = 0x00000006'u16
  TB_KEY_CTRL_G* = 0x00000007'u16
  TB_KEY_BACKSPACE* = 0x00000008'u16
  TB_KEY_CTRL_H* = 0x00000008'u16 # clash with 'CTRL_BACKSPACE'
  TB_KEY_TAB* = 0x00000009'u16
  TB_KEY_CTRL_I* = 0x00000009'u16 # clash with 'TAB'
  TB_KEY_CTRL_J* = 0x0000000A'u16
  TB_KEY_CTRL_K* = 0x0000000B'u16
  TB_KEY_CTRL_L* = 0x0000000C'u16
  TB_KEY_ENTER* = 0x0000000D'u16
  TB_KEY_CTRL_M* = 0x0000000D'u16 # clash with 'ENTER'
  TB_KEY_CTRL_N* = 0x0000000E'u16
  TB_KEY_CTRL_O* = 0x0000000F'u16
  TB_KEY_CTRL_P* = 0x00000010'u16
  TB_KEY_CTRL_Q* = 0x00000011'u16
  TB_KEY_CTRL_R* = 0x00000012'u16
  TB_KEY_CTRL_S* = 0x00000013'u16
  TB_KEY_CTRL_T* = 0x00000014'u16
  TB_KEY_CTRL_U* = 0x00000015'u16
  TB_KEY_CTRL_V* = 0x00000016'u16
  TB_KEY_CTRL_W* = 0x00000017'u16
  TB_KEY_CTRL_X* = 0x00000018'u16
  TB_KEY_CTRL_Y* = 0x00000019'u16
  TB_KEY_CTRL_Z* = 0x0000001A'u16
  TB_KEY_ESC* = 0x0000001B'u16
  TB_KEY_CTRL_LSQ_BRACKET* = 0x0000001B'u16 # clash with 'ESC'
  TB_KEY_CTRL_3* = 0x0000001B'u16 # clash with 'ESC'
  TB_KEY_CTRL_4* = 0x0000001C'u16
  TB_KEY_CTRL_BACKSLASH* = 0x0000001C'u16 # clash with 'CTRL_4'
  TB_KEY_CTRL_5* = 0x0000001D'u16
  TB_KEY_CTRL_RSQ_BRACKET* = 0x0000001D'u16 # clash with 'CTRL_5'
  TB_KEY_CTRL_6* = 0x0000001E'u16
  TB_KEY_CTRL_7* = 0x0000001F'u16
  TB_KEY_CTRL_SLASH* = 0x0000001F'u16 # clash with 'CTRL_7'
  TB_KEY_CTRL_UNDERSCORE* = 0x0000001F'u16 # clash with 'CTRL_7'
  TB_KEY_SPACE* = 0x00000020'u16
  TB_KEY_BACKSPACE2* = 0x0000007F'u16
  TB_KEY_CTRL_8* = 0x0000007F'u16 # clash with 'DELETE'
# These are fail ones (do not exist)
# #define TB_KEY_CTRL_1 clash with '1'
# #define TB_KEY_CTRL_9 clash with '9'
# #define TB_KEY_CTRL_0 clash with '0'
# Currently there is only one modificator
const
  TB_MOD_ALT* = 0x00000001'u8
# colors
const
  TB_BLACK* = 0x00000000'u16
  TB_RED* = 0x00000001'u16
  TB_GREEN* = 0x00000002'u16
  TB_YELLOW* = 0x00000003'u16
  TB_BLUE* = 0x00000004'u16
  TB_MAGENTA* = 0x00000005'u16
  TB_CYAN* = 0x00000006'u16
  TB_WHITE* = 0x00000007'u16
  TB_DEFAULT* = 0x0000000F'u16
# attributes
const
  TB_BOLD* = 0x00000010'u16
  TB_UNDERLINE* = 0x00000020'u16
type
  tb_cell* {.pure, final.} = object
    ch*: uint32
    fg*: uint16
    bg*: uint16

type
  tb_event* {.pure, final.} = object
    kind*: uint8
    modifier*: uint8
    key*: uint16
    ch*: uint32
    w*: int32
    h*: int32

const
  TB_EUNSUPPORTED_TERMINAL* = - 1
  TB_EFAILED_TO_OPEN_TTY* = - 2
  TB_EPIPE_TRAP_ERROR* = - 3


{.push callConv: cdecl, importc: "tb_$1".}

when defined(LinkStatically):
  {.passl: "-Wl,-Bstatic -ltermbox -Wl,-Bdynamic".}
  {.push header: "<termbox.h>".}
else:
  {.push dynlib: LibName.}

proc init*(): cint
proc shutdown*()
proc width*(): cuint
proc height*(): cuint
proc clear*()
proc present*()
const
  TB_HIDE_CURSOR* = - 1
proc set_cursor*(cx: cint; cy: cint)
proc put_cell*(x: cuint; y: cuint; cell: ptr tb_cell)
proc change_cell*(x: cuint; y: cuint; ch: uint32; fg: uint16;
                     bg: uint16)
proc blit*(x: cuint; y: cuint; w: cuint; h: cuint; cells: ptr tb_cell)
const
  TB_INPUT_ESC* = 1
  TB_INPUT_ALT* = 2
# with 0 returns current input mode
proc select_input_mode*(mode: cint): cint
proc set_clear_attributes*(fg: uint16; bg: uint16)
const
  TB_EVENT_KEY* = 1
  TB_EVENT_RESIZE* = 2
proc peek_event*(event: ptr tb_event; timeout: cuint): cint
proc poll_event*(event: ptr tb_event): cint
# these return:
# 0 - no events, no errors,
# 1 - key event
# 2 - resize event
# -1 - error (input buffer overflow, discarded input)
#
#   timeout in milliseconds
#
# glib based interface
# TODO
# utility utf8 functions
const
  TB_EOF* = - 1

proc utf8_char_length*(c: char): cint
proc utf8_char_to_unicode*(outp: ptr uint32; c: cstring): cint
proc utf8_unicode_to_char*(outp: cstring; c: uint32): cint

{.pop.}
{.pop.}
