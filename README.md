# Dow SMP - Minecraft Server Dev Environment

Optimized development environment for **Paper 1.20.4**, ready for local work and cloud development on **GitHub Codespaces**.

---

## 🚀 How to Run on GitHub Codespaces (Cloud Hosting for Dev)

1. **Push this repo to your GitHub account**:
   ```bash
   git remote add origin https://github.com/<YOUR_USERNAME>/<YOUR_REPO_NAME>.git
   git branch -M main
   git push -u origin main
   ```
2. On GitHub, click the green **`<> Code`** button.
3. Select the **Codespaces** tab and click **Create codespace on main**.
4. GitHub Codespaces will launch a Linux container with Java 21 pre-installed and automatically run `scripts/setup.sh`.
5. In the Codespaces terminal, start the server:
   ```bash
   ./scripts/start.sh
   ```
6. Check the **Ports** tab in VS Code / Codespaces (port `25565`) to view the forwarded address.

---

## 💻 Local Running (Windows)

- Double click `run.bat` or run:
  ```powershell
  .\run.bat
  ```
  *(Note: Minecraft 1.20.x requires Java 17 or higher).*

---

## 📁 Repository Structure
```
├── .devcontainer/         # GitHub Codespaces container definition (Java 21)
├── plugins/               # Place plugin jars (.jar) and plugin config folders here
├── scripts/
│   ├── setup.sh           # Auto-fetches Paper jar and accepts EULA
│   └── start.sh           # Starts server with Aikar's optimized flags
├── server.properties      # Server configuration
├── eula.txt               # EULA agreement
├── .gitignore             # Ignores large worlds, logs, and jars
└── run.bat                # Windows local launch script
```
