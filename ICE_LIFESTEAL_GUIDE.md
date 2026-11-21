# ❄ Frostbite Lifesteal SMP - Server Management Guide ❄

Welcome to **Frostbite Lifesteal SMP**. Your server is fully configured with an immersive ice & crystal theme, robust competitive mechanics, rank hierarchy, and industry-grade anticheat protection.

---

## 💎 Installed Features & Plugins

| Category | Plugins | Purpose |
| :--- | :--- | :--- |
| **Core Lifesteal** | `LifeSteal.jar` | Steal hearts on kill (+1), drop on death (-1), custom Heart of Frost and Glacial Revive Beacon recipes. Max 20 hearts, elimination on 0. |
| **Clans & Teams** | `BetterTeams.jar` | Player-created ice clans (`/team create`), shared clan chat, friendly-fire immunity. |
| **Anticheat** | `GrimAC.jar` | 1:1 async Netty physics simulation preventing Fly, Speed, Jesus, Reach, Timer, BadPackets. |
| **Visuals & Tablist** | `TAB.jar`, `DecentHolograms.jar` | Ice gradient header/footer, animated frost scoreboard, spawn guide & leaderboard holograms. |
| **Economy & Roles** | `Vault.jar`, `LuckPerms.jar`, `EssentialsX` | Complete permissions system, prefix tags in chat/tab, economy balance tracking. |
| **Loot & Spawns** | `GoldenCrates.jar`, `ZNPCsPlus.jar`, `WorldEdit.jar` | Frost & Blizzard crates, interactive spawn NPCs, spawn schematic ready to paste. |
| **World Border** | `Chunky.jar`, `ChunkyBorder.jar` | 10,000 x 10,000 icy combat boundary, pre-generated chunks to prevent lag. |

---

## 👑 Ice-Themed Rank Hierarchy

Chat and Tablist automatically format prefixes according to these ranks:

- **Staff**:
  - `&#9d4edd&l[Owner]` — Highest authority (`/lp user <name> parent set owner`)
  - `&#e63946&l[Admin]` — Server administrators
  - `&#0077b6&l[Mod]` — Moderators & chat enforcers
  - `&#70e000&l[Helper]` — Community guides
- **Donator / Prestige**:
  - `&#00ffff&l[SubZero]` — Top tier ice rank
  - `&#5271ff&l[Permafrost]` — Tier 3 prestige
  - `&#38b6ff&l[Blizzard]` — Tier 2 prestige
  - `&#00e5ff&l[Glacier]` — Tier 1 prestige
- **Default Player**:
  - `&#00d2ff[Frostborn]` — Default player group

---

## 🛠️ In-Game Quick Start Commands (Run in Server Console or In-Game as OP)

### 1. Set the 10,000 x 10,000 World Border
```text
worldborder set 10000
chunky border add world 10000
```

### 2. Paste the Ice Spawn Hub in the Void World
Teleport to the dedicated void spawn world:
```text
/mv tp spawn
```
Create a temporary base block to stand on (if needed):
```text
//up 1
```
Load and paste the pre-installed ice spawn schematic:
```text
//schem load spawn
//paste
/mv setspawn
setworldspawn
```

### 3. Spawn Interactive Ice NPCs
Create a guide NPC:
```text
/znpcs create 1 PLAYER &#00ffff&l❄ Glacial Guide ❄
/znpcs lines 1 add &7Click to learn the rules of Frostbite!
```

Create a Crates NPC:
```text
/znpcs create 2 PLAYER &#38b6ff&l❄ Cryo-Merchant ❄
/znpcs lines 2 add &7Trade rewards for Crate Keys!
```

---

## ❄ Custom Lifesteal Items
- **Heart of Frost**: Right-click to consume for `+1 Heart` (Capped at 20).
- **Glacial Revive Beacon**: Crafted with rare Nether stars and cryo-blocks to resurrect eliminated teammates from spectator status.
