{
  pkgs,
  inputs,
  ...
}:

let
  noctalia = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.packages = [ pkgs.matugen ];

  programs.hyprshot.enable = true;

  wayland.windowManager.hyprland.settings = {
    "$menu" = "noctalia-shell ipc call launcher toggle";
  };

  services.hypridle = {
    enable = true;

    settings = {
      general = {
        ignore_dbus_inhibit = false;
      };

      listener = [
        {
          timeout = 5 * 60;
          on-timeout = "${noctalia}/bin/noctalia-shell ipc call lockScreen lock";
        }
        {
          timeout = 5 * 60; # 5 min
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 10 * 60; # 10 min
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;

    settings = {
      settingsVersion = 43;
      bar = {
        position = "top";
        monitors = [
          "DP-3"
        ];
        density = "default";
        showOutline = false;
        showCapsule = true;
        capsuleOpacity = 1;
        backgroundOpacity = 0.6;
        useSeparateOpacity = true;
        floating = true;
        marginVertical = 5;
        marginHorizontal = 5;
        outerCorners = true;
        exclusive = true;
        hideOnOverview = false;
        widgets = {
          left = [
          {
            icon = "rocket";
            id = "Launcher";
            usePrimaryColor = false;
          }
          {
            compactMode = false;
            compactShowAlbumArt = true;
            compactShowVisualizer = false;
            hideMode = "hidden";
            hideWhenIdle = false;
            id = "MediaMini";
            maxWidth = 145;
            panelShowAlbumArt = true;
            panelShowVisualizer = true;
            scrollingMode = "hover";
            showAlbumArt = false;
            showArtistFirst = true;
            showProgressRing = true;
            showVisualizer = false;
            useFixedWidth = false;
            visualizerType = "linear";
          }
          {
            characterCount = 2;
            colorizeIcons = false;
            enableScrollWheel = true;
            followFocusedScreen = false;
            groupedBorderOpacity = 1;
            hideUnoccupied = false;
            iconScale = 0.8;
            id = "Workspace";
            labelMode = "index";
            showApplications = false;
            showLabelsOnlyWhenOccupied = true;
            unfocusedIconsOpacity = 1;
          }
          {
            colorizeIcons = false;
            hideMode = "hidden";
            id = "ActiveWindow";
            maxWidth = 1452;
            scrollingMode = "hover";
            showIcon = true;
            useFixedWidth = false;
          }
          ];
          center = [
          {
            customFont = "";
            formatHorizontal = "HH:mm ddd, MMM dd";
            formatVertical = "HH mm - dd MM";
            id = "Clock";
            tooltipFormat = "HH:mm ddd, MMM dd";
            useCustomFont = false;
            usePrimaryColor = false;
          }
          {
            hideWhenZero = false;
            hideWhenZeroUnread = false;
            id = "NotificationHistory";
            showUnreadBadge = true;
          }
          {
            colorName = "primary";
            hideWhenIdle = true;
            id = "AudioVisualizer";
            width = 100;
          }
          {
            defaultSettings = {
              hideInactive = false;
              removeMargins = false;
            };
            id = "plugin:privacy-indicator";
          }
          ];
          right = [
          {
            defaultSettings = {
              mode = "region";
            };
            id = "plugin:screenshot";
          }
          {
            compactMode = true;
            diskPath = "/";
            id = "SystemMonitor";
            showCpuTemp = true;
            showCpuUsage = true;
            showDiskUsage = false;
            showGpuTemp = false;
            showLoadAverage = false;
            showMemoryAsPercent = false;
            showMemoryUsage = true;
            showNetworkStats = true;
            showSwapUsage = false;
            useMonospaceFont = true;
            usePrimaryColor = false;
          }
          {
            blacklist = [ ];
            colorizeIcons = false;
            drawerEnabled = true;
            hidePassive = false;
            id = "Tray";
            pinned = [ ];
          }
          {
            deviceNativePath = "";
            displayMode = "onhover";
            hideIfIdle = false;
            hideIfNotDetected = true;
            id = "Battery";
            showNoctaliaPerformance = false;
            showPowerProfiles = false;
            warningThreshold = 30;
          }
          {
            displayMode = "onhover";
            id = "Volume";
            middleClickCommand = "pwvucontrol || pavucontrol";
          }
          {
            displayMode = "onhover";
            id = "Bluetooth";
          }
          {
            displayMode = "onhover";
            id = "Network";
          }
          {
            colorizeDistroLogo = false;
            colorizeSystemIcon = "none";
            customIconPath = "";
            enableColorization = false;
            icon = "noctalia";
            id = "ControlCenter";
            useDistroLogo = false;
          }
          {
            defaultSettings = {
              hideInactive = false;
              removeMargins = false;
            };
            id = "plugin:privacy-indicator";
          }
          {
            defaultSettings = {
              hideBackground = false;
              minimumThreshold = 10;
            };
            id = "plugin:catwalk";
          }
          ];
        };
        screenOverrides = [ ];
      };
      general = {
        avatarImage = "/home/murtaza/Pictures/Edited/IMG_1559.jpg";
        dimmerOpacity = 0.4;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 1;
        radiusRatio = 1;
        iRadiusRatio = 1;
        boxRadiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = false;
        compactLockScreen = false;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = false;
        enableShadows = false;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        language = "";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = true;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 10000;
      };
      ui = {
        fontDefault = "JetBrainsMono Nerd Font";
        fontFixed = "Operator Mono Book";
        fontDefaultScale = 0.92;
        fontFixedScale = 1;
        tooltipsEnabled = true;
        panelBackgroundOpacity = 0.76;
        panelsAttachedToBar = true;
        settingsPanelMode = "centered";
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        networkPanelView = "wifi";
        bluetoothHideUnnamedDevices = false;
        boxBorderEnabled = false;
      };
      location = {
        name = "Stockholm";
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = -1;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
      };
      calendar = {
        cards = [
        {
          enabled = true;
          id = "calendar-header-card";
        }
        {
          enabled = true;
          id = "calendar-month-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
        ];
      };
      wallpaper = {
        enabled = true;
        overviewEnabled = false;
        directory = "/home/murtaza/Pictures/Wallpapers";
        monitorDirectories = [ ];
        enableMultiMonitorDirectories = false;
        showHiddenFiles = false;
        viewMode = "single";
        setWallpaperOnAllMonitors = true;
        fillMode = "crop";
        fillColor = "#000000";
        useSolidColor = false;
        solidColor = "#1a1a2e";
        automationEnabled = false;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.05;
        panelPosition = "center";
        hideWallpaperFilenames = false;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenRatios = "";
        wallhavenApiKey = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenResolutionHeight = "";
      };
      appLauncher = {
        enableClipboardHistory = false;
        autoPasteClipboard = false;
        enableClipPreview = true;
        clipboardWrapText = true;
        position = "center";
        pinnedApps = [ ];
        useApp2Unit = false;
        sortByMostUsed = true;
        terminalCommand = "ghostty -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "list";
        showCategories = true;
        iconMode = "tabler";
        showIconBackground = false;
        ignoreMouseInput = false;
        screenshotAnnotationTool = "";
      };
      controlCenter = {
        position = "close_to_bar_button";
        diskPath = "/";
        shortcuts = {
          left = [
          {
            id = "Network";
          }
          {
            id = "Bluetooth";
          }
          {
            id = "WallpaperSelector";
          }
          ];
          right = [
          {
            id = "Notifications";
          }
          {
            id = "PowerProfile";
          }
          {
            id = "KeepAwake";
          }
          {
            id = "NightLight";
          }
          ];
        };
        cards = [
        {
          enabled = true;
          id = "profile-card";
        }
        {
          enabled = true;
          id = "shortcuts-card";
        }
        {
          enabled = true;
          id = "audio-card";
        }
        {
          enabled = false;
          id = "brightness-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
        {
          enabled = true;
          id = "media-sysmon-card";
        }
        ];
      };
      systemMonitor = {
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        swapWarningThreshold = 80;
        swapCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        cpuPollingInterval = 3000;
        tempPollingInterval = 3000;
        gpuPollingInterval = 3000;
        enableDgpuMonitoring = false;
        memPollingInterval = 3000;
        diskPollingInterval = 3000;
        networkPollingInterval = 3000;
        loadAvgPollingInterval = 3000;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
        externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
      };
      dock = {
        enabled = true;
        position = "bottom";
        displayMode = "auto_hide";
        backgroundOpacity = 1;
        floatingRatio = 1;
        size = 1.4;
        onlySameOutput = false;
        monitors = [ ];
        pinnedApps = [ ];
        colorizeIcons = false;
        pinnedStatic = true;
        inactiveIndicators = true;
        deadOpacity = 0.6;
        animationSpeed = 1.2000000000000002;
      };
      network = {
        wifiEnabled = true;
        bluetoothRssiPollingEnabled = false;
        bluetoothRssiPollIntervalMs = 10000;
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
      };
      sessionMenu = {
        enableCountdown = true;
        countdownDuration = 10000;
        position = "top_right";
        showHeader = true;
        largeButtonsStyle = true;
        largeButtonsLayout = "grid";
        showNumberLabels = true;
        powerOptions = [
        {
          action = "lock";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "suspend";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "hibernate";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "reboot";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "logout";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "shutdown";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        ];
      };
      notifications = {
        enabled = true;
        monitors = [ ];
        location = "top_right";
        overlayLayer = true;
        backgroundOpacity = 1;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        enableKeyboardLayoutToast = true;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium,edge";
        };
        enableMediaToast = true;
      };
      osd = {
        enabled = true;
        location = "top_right";
        autoHideMs = 2000;
        overlayLayer = true;
        backgroundOpacity = 1;
        enabledTypes = [
          0
            1
            2
            4
            3
        ];
        monitors = [ ];
      };
      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        cavaFrameRate = 30;
        visualizerType = "linear";
        mprisBlacklist = [ ];
        preferredPlayer = "";
        volumeFeedback = false;
      };
      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
      };
      colorSchemes = {
        useWallpaperColors = true;
        predefinedScheme = "Noctalia (default)";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        generationMethod = "tonal-spot";
        monitorForColors = "";
      };
      templates = {
        activeTemplates = [
        {
          enabled = true;
          id = "zenBrowser";
        }
        ];
        enableUserTheming = false;
      };
      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };
      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
        screenLock = "";
        screenUnlock = "";
        performanceModeEnabled = "";
        performanceModeDisabled = "";
        startup = "";
        session = "";
      };
      desktopWidgets = {
        enabled = true;
        gridSnap = true;
        monitorWidgets = [
        {
          name = "DP-3";
          widgets = [
          {
            clockStyle = "analog";
            customFont = "";
            format = "HH:mm
              d MMMM yyyy";
            id = "Clock";
            roundedCorners = true;
            scale = 1.63286056916196;
            showBackground = false;
            useCustomFont = false;
            usePrimaryColor = false;
            x = 40;
            y = 80;
          }
          {
            id = "Weather";
            scale = 1;
            showBackground = false;
            x = 40;
            y = 360;
          }
          ];
        }
        ];
      };
    };
  };
}
