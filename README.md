# psiplus-otr-g2n
A small script to help migrate psi-plus' otr key file.

Guids are used to represent account in psi-plus' otr files, while other client such as pidgin uses JID directly, so JIDs should first be queried from `accounts.xml` with corresponding guids, and then used to replace those guids. This script is written to automate such procedure.
