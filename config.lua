print "Starting Emula4/LUA"

config = require 'config'

config.trace_bitmap_set(0x40000)

--[====[
#define DEBUG_EXIT              0x0001
#define DEBUG_EXCEPTION         0x0002
#define DEBUG_PREPARE_VM        0x0004
#define DEBUG_PREPARE_PROGRAM   0x0008
#define DEBUG_REBASE            0x0010
#define DEBUG_LINKEDIT          0x0020
#define DEBUG_MMIO              0x0040
#define DEBUG_IA                0x0080
#define VERBOSE_STARTUP         0x0100
#define DEBUG_PL011             0x0200
#define DEBUG_DEVICE            0x0400
#define DEBUG_RAM               0x0800
#define DEBUG_FDT               0x1000
#define DEBUG_CFI_OPERATIONS    0x2000
#define DEBUG_GIC               0x4000
#define DEBUG_GIC_FULL          0x8000
#define DEBUG_PSCI              0x10000
#define DEBUG_NS16550A          0x20000
#define TRACE_EMULATION         0x40000
#define TRACE_VMM               0x80000
#define DEBUG_ARMADA            0x100000
#define TRACE_PATCHING          0x200000
#define DEBUG_SWITCHEL          0x400000
#define DEBUG_XENON             0x800000
#define DEBUG_XENON_MMIO        0x1000000
#define TRACE_SWITCHEL          0x2000000
#define DEBUG_VIRTIO_TRANSPORT_MMIO 0x4000000
#define DEBUG_VIRTIO_TRANSPORT_PCI  0x8000000
#define DEBUG_VIRTIO_VIRTQ          0x10000000
#define DEBUG_VIRTIO_BLK            0x20000000
#define DEBUG_VIRTIO_BLK_MMIO       0x40000000
#define TRACE_EP                    0x80000000
#define TRACE_SMC                   0x100000000
--]====]
