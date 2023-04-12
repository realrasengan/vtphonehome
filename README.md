# vt.sh or vtphonehome

This asks OpenAI to transcribe your voice and simply puts whatever you said into the input area on macOS. Voice dictation with just bash and OpenAI on a macOS (and osascript).

## Video Example (Turn Sound On)



https://user-images.githubusercontent.com/466317/231567467-b2798f21-d43a-434d-a7b3-46a2abc58432.mp4



## Instructions

1. Get homebrew

2. Clone this
```
git clone https://github.com/realrasengan/vtphonehome
```

3. Install sox, lame and jq
```
brew install sox lame jq
```

4. Install an Automator

- Open Automator

- Create a new Application

- Go to Run Shell Script

- Put:
```
/Path/to/vtphonehome/vt.sh
```

5. Save

6. Move to Applications Folder


## License

MIT Licensed.
