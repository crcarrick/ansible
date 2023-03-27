import fs from "fs/promises";

async function main() {
  const encryptedFiles = await Promise.all([
    fs.readFile("roles/chris_mac/vars/main/secrets.yml", "utf-8"),
    fs.readFile("roles/chris_mac/vars/main/ssh.yml", "utf-8"),
  ]);

  if (
    encryptedFiles.some((contents) => !contents.startsWith("$ANSIBLE_VAULT"))
  ) {
    console.error(
      "You have unencrypted Ansible Vault files. Please encrypt them before committing."
    );

    process.exit(1);
  }
}

main();
