{ pkgs, ... }: {
  programs.zsh.shellAliases.lgit = "lazygit";

  programs.lazygit = {
    enable = true;

    settings = {
      gui = {
        expandFocusedSidePanel = false;
        shortTimeFormat = "3:04PM";
        theme = {
          activeBorderColor = [ "#c4b28a" "bold" ];
          inactiveBorderColor = [ "#625e5a" ];
          searchingActiveBorderColor = [ "#938AA9" "bold" ];
          optionsTextColor = [ "#8ea49e" ];
          selectedLineBgColor = [ "#2A2A37" ];
          cherryPickedCommitFgColor = [ "#393836" ];
          cherryPickedCommitBgColor = [ "#c4746e" ];
          markedBaseCommitFgColor = [ "#393836" ];
          markedBaseCommitBgColor = [ "#c4b28a" ];
          unstagedChangesColor = [ "#c4b28a" ];
          defaultFgColor = [ "#DCD7BA" ];
        };
        authorColors = { "*" = "#b4befe"; };
        commitLength = { show = true; };
        mouseEvents = true;
        skipDiscardChangeWarning = false;
        skipStashWarning = false;
        showRandomTip = true;
        showCommandLog = true;
        commandLogSize = 8;
      };
      git = {
        pagers = [{ colorArg = "always";
          pager = "${pkgs.delta}/bin/delta --dark --paging=never";
        }];
        commit = {
          signOff = false; };
        merging = {
          manualCommit = false;
          args = "";
        };
        log = { order = "topo-order";
          showGraph = "when-maximised";
          showWholeGraph = false;
        };
        skipHookPrefix = "WIP";
        mainBranches = [ "master" "main" ];
        autoFetch = true;
        autoRefresh = true;
        branchLogCmd = "${pkgs.git}/bin/git log --graph --color=always --abbrev-commit --decorate --date=relative --pretty=medium {{branchName}} --";
        disableForcePushing = false;
        parseEmoji = false;
        allBranchesLogCmds = [ "${pkgs.git}/bin/git log --graph --all --color=always --abbrev-commit --decorate --date=relative  --pretty=medium" ];
      };
      os = {
        edit = "";
        editAtLine = "";
        editAtLineAndWait = "";
        open = "";
        openLink = "";
      };
      refresher = null;
      update = null;
      confirmOnQuit = false;
      quitOnTopLevelReturn = false;
      disableStartupPopups = false;
      keybinding = {
        universal = {
          quit = "q";
          quitWithoutChangingDirectory = "Q";
          nextMatch = "n";
          prevMatch = "N";
          select = "<space>";
          goInto = "<enter>";
          openRecentRepos = "<c-r>";
          confirm = "<enter>";
          remove = "d";
          new = "n";
          edit = "e";
          openFile = "o";
          executeShellCommand = ":";
          createRebaseOptionsMenu = "m";
          pushFiles = "P";
          pullFiles = "p";
          refresh = "R";
          createPatchOptionsMenu = "<c-p>";
          nextTab = "]";
          prevTab = "[";
          nextScreenMode = "+";
          prevScreenMode = "_";
          undo = "z";
          redo = "<c-z>";
          filteringMenu = "<c-s>";
          diffingMenu = "W";
          copyToClipboard = "<c-o>";
          submitEditorText = "<enter>";
          extrasMenu = "@";
          toggleWhitespaceInDiffView = "<c-w>";
          increaseContextInDiffView = "}";
          decreaseContextInDiffView = "{";
        };
        status = {
          checkForUpdate = "u";
          recentRepos = "<enter>";
        };
        files = {
          commitChanges = "c";
          amendLastCommit = "A";
          commitChangesWithEditor = "C";
          confirmDiscard = "x";
          ignoreFile = "i";
          refreshFiles = "r";
          stashAllChanges = "s";
          viewStashOptions = "S";
          viewResetOptions = "D";
          fetch = "f";
          toggleTreeView = "`";
          openMergeOptions = "M";
          openStatusFilter = "<c-b>";
        };
        branches = {
          createPullRequest = "o";
          viewPullRequestOptions = "O";
          checkoutBranchByName = "c";
          forceCheckoutBranch = "F";
          rebaseBranch = "r";
          renameBranch = "R";
          mergeIntoCurrentBranch = "M";
          viewGitFlowOptions = "i";
          createTag = "T";
          pushTag = "P";
          fetchRemote = "f";
        };
        commits = {
          squashDown = "s";
          renameCommit = "r";
          renameCommitWithEditor = "R";
          viewResetOptions = "g";
          markCommitAsFixup = "f";
          squashAboveCommits = "S";
          amendToCommit = "A";
          revertCommit = "t";
          cherryPickCopy = "c";
          cherryPickCopyRange = "C";
          pasteCommits = "v";
          tagCommit = "T";
          checkoutCommit = "<space>";
          resetCherryPick = "<c-R>";
          copyCommitMessageToClipboard = "<c-y>";
          openLogMenu = "<c-l>";
          viewBisectOptions = "b";
        };
        stash = {
          popStash = "g";
          renameStash = "r";
        };
        commitFiles = {
          checkoutCommitFile = "c";
        };
        main = {
          toggleDragSelect = "v";
          toggleDragSelect-alt = "V";
          toggleSelectHunk = "a";
          pickBothHunks = "b";
        };
        submodules = {
          init = "i";
          update = "u";
          bulkMenu = "b";
        };
      };
    };
  };
               }
