# RapidHostBaseline v1.0.0

**Lightweight Windows host baseline collector for defenders and investigators.
**
----
For a long time in my career, I kept hearing the same advice:

> “Get a baseline of your systems.”

That makes sense in theory. You can deploy a golden image with required applications, hardening policies, and configurations. But in reality, systems change. Software gets installed, settings drift, users need tools, and environments evolve.

I wanted something simple — a way to capture a quick snapshot of a machine whenever I wanted, without needing an enterprise EDR, SIEM, or complex tooling.

So I built **RapidHostBaseline** a couple of years ago.

---

## Version

**v1.0.0** — Initial public release

---

## What It Does

RapidHostBaseline is a lightweight batch script that gathers key system information so you can record what a machine looks like:

- On deployment day  
- On a scheduled basis  
- During investigations  
- Before and after changes  

It’s designed to be fast, portable, transparent, and easy to understand.

---

## Why This Exists

If you have a large security budget and a full team, you may already have tooling that provides this visibility.

But many environments don’t.

This tool is built for:

- Small teams  
- Solo IT/security professionals  
- Labs and training environments  
- Investigators  
- Defenders wearing multiple hats  

It provides a **free starting point** for establishing system baselines and comparing changes over time.

---

## What It Collects

When you run it, you get a structured snapshot of:

- System Information  
- Running Processes  
- Network Activity (including owning executables)  
- Local Network Mapping  
- DNS Cache Activity  
- Installed Programs  
- Services  
- Startup Entries  
- Scheduled Tasks  
- User & Admin Accounts  
- Firewall Rules  

---

## How to Use

1. Download the repository and unzip it.  
2. Place `RapidHostBaseline.bat` in the folder where you want the output to appear.  
3. Double-click the `.bat` file **or run it from Command Prompt**.  
4. The script will create a **timestamped folder in the same directory as the script** with all collected information.  
5. To compare snapshots, run `CompareSnapshots.bat` and pass **two snapshot folders** as parameters:

```cmd
CompareSnapshots.bat ".\Baseline_2024-02-18_14-20" ".\Baseline_2024-02-18_14-29"
```

---

## Example Output Structure

```
Baseline_2024-02-18_14-20
│
├── systeminfo.txt
├── processes.txt
├── netstat.txt
├── arp.txt
├── routes.txt
├── dns_cache.txt
├── installed_programs.txt
├── services.txt
├── startup.txt
├── scheduled_tasks.txt
├── users.txt
├── admins.txt
└── firewall_rules.txt
```

---

## Notes

- Some commands (like `netstat -b`) require **Administrator privileges**.  
- Script is **read-only** and does not modify system settings.  
- Output is plain text so it can be diffed, archived, or analyzed easily.  

---

## Who This Is For

This isn’t meant to replace enterprise tools.

It’s meant for people who want quick visibility without complexity:

- admins  
- defenders  
- analysts  
- lab builders  
- learners  

---

## Final Thoughts

I’m not a programmer. I’m just someone who wanted a fast and practical way to see what’s happening on a machine.

This is the simplest tool I could build that actually helps.

If it helps you too, that’s a win.

---

## License

MIT License — free to use, modify, and share.
