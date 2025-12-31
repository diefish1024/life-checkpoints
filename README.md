<h3 align="center">🚩 Life Checkpoints</h3>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com/?lines=%E7%BB%99%E5%B2%81%E6%9C%88%E4%BB%A5%E5%AD%98%E6%A1%A3%EF%BC%8C%E7%BB%99%E6%9C%AA%E6%9D%A5%E4%BB%A5%E5%9B%9E%E5%93%8D%E3%80%82;Version+controlling+my+life.&font=Fira+Code&center=true&width=500&height=50&duration=4000&pause=1000" alt="Typing SVG">
</p>

A repository for annual public reviews and encrypted time capsules for my future self.

## 📂 Project Structure

This repository contains two types of content for each year:
1. **Public Summary (`README.md`)**: Accessible to everyone. My annual review, technical achievements, and life updates.
2. **Time Capsule (`letter_to_future.enc`)**: **AES-256 Encrypted**. A private letter to myself, scheduled to be delivered via email 4 years later.

## 📝 End-of-Year Routine

Follow these steps on December 31st of each year:

1. **Create Directory**：
    ```bash
    mkdir 20xx
    ```

2. **Write Content**:
    - Create `20xx/README.md` (The public summary).
    - Create `20xx/letter_to_future.md` (The private letter).

3. **Encrypt the Capsule**：
    ```bash
    ./encrypt.sh 20xx
    # Enter the TIME_CAPSULE_KEY when prompted
    rm 20xx/letter_to_future.md
    ```

4. **Commit & Push**：
    ```bash
    git add .
    git commit -m "chore: archive 20xx checkpoints"
    git push
    ```

## ⚙️ How it Works

A GitHub Action runs automatically on Dec 31th.

- calculates `Target Year = Current Year - 4`.
- looks for `letter_to_future.enc` in that year's folder.
- decrypts the file using the repository secret.
- converts the Markdown to HTML and emails it to me.

### Configuration (Secrets)

The following secrets are stored in Repository Settings:

- `TIME_CAPSULE_KEY`: The master password for encryption/decryption.
- `MAIL_USERNAME`: SMTP email address.
- `MAIL_PASSWORD`: SMTP App Password.

## 🔐 Manual Decryption (Backup)

If GitHub Actions fails or  need to access a letter manually:

```bash
openssl enc -d -aes-256-cbc -pbkdf2 -in 20xx/letter_to_future.enc -out output.md
```