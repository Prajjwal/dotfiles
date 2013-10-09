-- Print the window and application name of everything opened if running with
-- the --debug option. Useful.

debug_print("Window Name: " .. get_window_name());
debug_print("App Name: " .. get_application_name());

-- Firefox
if (get_application_name() == "Firefox") then

	set_window_workspace(1);
	maximize();

end

-- Pidgin
if (get_application_name() == "Pidgin") then

	set_window_workspace(2);

	if (get_window_name() == "Buddy List") then
		set_window_geometry(500, 100, 260, 750);
	else
		-- Wait half a second before attempting to maximize. Weird behaviour
		-- otherwise. Couldn't find a solution on the interwebs.
		os.execute("sleep 0.5");
		maximize();
	end

end

-- Transmission & qBittorrent
if (get_application_name() == "Transmission" or string.match(get_application_name(), "qBittorrent")) then
	
	set_window_workspace(3);

end
