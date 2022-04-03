# Pihole Time Blocker

## Installation

1. Clone the repo
2. Make script executable: `chmod +x update-group.sh`
3. Setup group in pihole
4. Setup cronjobs to enable/disable groups

## Pihole Setup

We're taking advantage of pihole groups in order to manage our domains.

1. Log into your pihole
2. Navigate to `Group Management`
3. Create a new Group
4. Assign your desired clients to your new Group
5. Configure your `Domains` or `Adlists` for domains you want to block
6. Your domains and adlists should all be assigned under the new group


**Note:** Adlists can only contain specific domains and you can point it to local files using the `file:///path/to/adlist` syntax

## Setup Cronjobs

Using cronjobs, the script can be configured to enable or disable the specified pihole group as specific times. 

1. Edit cronjobs using: `crontab -e`
2. Configure your cronjobs for enabling/disabling pihole group

##### Example Cronjob
```
# 12am everyday from Monday - Friday. Enable the group list as the pihole user
0 0 * * 1-5 pihole /path/to/script/update-groups.sh <GroupName> <enable|disable>

# 5pm everyday from Monday - Friday. Disable the group as the pihole user
0 0 * * 1-5 pihole /path/to/script/update-groups.sh <GroupName> <enable|disable>
```

