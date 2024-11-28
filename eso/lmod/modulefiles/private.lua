local mount_dir = "/eltdev"

local introot = "/INTROOT"
local dataroot = "/DATAROOT"

setenv("INTROOT", introot)
setenv("PREFIX", introot)
setenv("DATAROOT", dataroot)
setenv("CII_LOGS", "/var/log/elt")

load("eltdev")
load("introot")

prepend_path("PKG_CONFIG_PATH", pathJoin(os.getenv("INTROOT"), "/lib64/pkgconfig"))

local lsv_root = "/elt/lsv"
local python_dirname = "python" .. os.getenv("PYTHON_VERSION")

prepend_path("PATH", pathJoin(root,"/bin"))
prepend_path("LD_LIBRARY_PATH", pathJoin(root, "/lib64"))
prepend_path("PYTHONPATH", pathJoin(root, "/lib/", python_dirname,"/site-packages"))
prepend_path("WDEPPATH", pathJoin(root, "/share/wdep"))
prepend_path("CFGPATH", pathJoin(root, "/resource"))
