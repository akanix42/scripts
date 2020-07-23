groupid() {
  python -c 'import grp; import sys; print(grp.getgrnam(sys.argv[1]).gr_gid)' "$@"
}
