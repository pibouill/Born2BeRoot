<p align="center">
  <img src="https://github.com/pibouill/42-project-badges/blob/main/badges/born2berootm.png" alt="ready to help"/>
</p>

# Born2BeRoot

### Main part

>This project consists of having you set up your first server by following specific rules.

>You must choose as an operating system either the latest stable version of Debian (no
testing/unstable), or the latest stable version of Rocky. Debian is highly recommended
if you are new to system administration.
---
- Manual partition and setting up encrypted logical volumes
<p align="center">
<img src="ressources/partitions.png">
  </p>

- SSH with UFW - enforcing strict rules
- Strong password policy (/etc/login.defs) and also with libpam-pwquality
- Configuring sudo usage, connection, password
- Creating a wall script running every 10mins from server startup with cron (see monitoring.sh)
  <p align="center">
<img src="ressources/script.png">
  </p>

---

### Bonus part

- Wordpress basic website set up with lighttpd, MariaDB and PHP
    <p align="center">
<img src="ressources/wp.png" width="500">
  </p>

---
>Set up a service of your choice that you think is useful
- OpenLiteSpeed
  <p align="center">
<img src="ressources/ols.png" width="500">
  </p>
