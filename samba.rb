#First download the package
# For ubuntu user
*sudo apt install samba-client
#For redhat
*yum install samba*
 #Type these commands to share you files
      #server side

  mkdir /new

semanage fcontext -a -t samba_share_t "/new(./)?"
      vim etc/samba/smb.conf
      #Then go into the configuration file and edit

         [share]
                  comment = hi
                  path = /new
                  public = yes
                  writable = yes
                  browsable = yes
        #Save and exit using wq! using vim
           systemctl restart smb
          systemctl enable smb
          systemctl restart nmb
          systemctl enable nmb

           firewall-cmd --permanent --add-service=samba
           firewall-cmd --reload

#Client side (ubuntu)
            sudo apt install samba-client
            smbclient //ip-add/share -N

#redhat
            yum repolistall
            yum clear all
            vim /etc/yum.repos.d/new.repo
      #On the configuration file
            [servername]
                          name = linux
                          base url = file://mnt
                          gpg check = 0
                          enable = 1
