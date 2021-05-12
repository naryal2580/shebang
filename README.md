# #!/5h3_b4nG
A very handy tool for cross-language peps.


## What do this do? Does it have some super cow powers?

`shebang` helps to keep stuff easy and pain-less by using `#!/shebang` at the head of files to any _supported languages_*, allowing executable flag via `chmod` and simply executing it.

Or, just use `$ sb $FILENAME` to execute it!!

Well, you might call it a simple cow power :stuck_out_tongue_winking_eye:

## Why!? Why??

It's really a pain in the _fingers_ to compile, execute the program and doing it over and over again along with different languages with different flavors of steps to perform the action. And, really annoying at times.

## How

### - To Install:

> Just run `$ sh ./main.sh --install` 

### - To Use:

> - **Using it as shebang!**
>   1. Add `#!/shebang` to the head of the file you want to execute.
>   2. Now, provide it some executable permissions `$ chmod +x $FILENAME` (accordingly)
>   3. **Important**: Do not tamper with the _file-extension_** as it's the only known way (to me) for recon of the language.
> - **Using the command `sb`**
>   1. Just run as `% sb $FILENAME`

### - Does it work?

> It checks the file extension of the file to determine which language is used and follows the simple instruction(s) to compile and execute ( or just execute it :wink:)

### - To Uninstall?

> Simply run `$ sh ./main.sh --uninstall`

### - To Re-Install?

> Want the new update of the script?
> Just `$ sh ./main --reinstall`
>
> **NOTE**: Make sure you've the latest clone, first.




## Supported Languages

I am on a plan to support as many languages as possible while making this _thing_ as light as possible. And, currently supported languages are listed below:

- Python
- Ruby
- Rust Lang
- Go Lang
- C
- JavaScript
- A few Shell Languages (sh, bash, zsh, fish)
  

## Issues or PRs?

I would love to hear them all :slightly_smiling_face:

---

*Your favorite language is not listed? Please feel free to open an issue for it.

**If you tend to modify it, the script won't be able to detect the language.
