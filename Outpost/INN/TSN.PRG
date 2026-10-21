program DEFAULT
		  lscitv.exe -cLSCI.CFG
        SET    NOLOAD_MUSIC TRUE
program Sierr
        if NOLOAD_MUSIC
                lscitv.exe  -m -cLSCI.CFG
        else
                lscitv.exe -cLSCI.CFG
        end
        SET    NOLOAD_MUSIC TRUE

program SLand
	 	  cd SL
        if NOLOAD_MUSIC
        	..\lscitv.exe -m
        else
        	..\lscitv.exe 
        end
        SET NOLOAD_MUSIC TRUE

program LLand
        cd LL
        if NOLOAD_MUSIC
        	..\lscitv.exe  -m
        else
        	..\lscitv.exe 
        END
        SET NOLOAD_MUSIC TRUE

program RedBaron
		  cd BARON
		  rb.exe -C..\LSCI.CFG
        SET NOLOAD_MUSIC    FALSE

program Golf
	cd GOLF
	golf.exe
        SET NOLOAD_MUSIC    FALSE

program Yserbius
		  cd YSERBIUS
		  cgenn.exe
        SET NOLOAD_MUSIC	FALSE

program Yserba
		  cd YSERBIUS
		  darkstrt.exe
        SET NOLOAD_MUSIC	FALSE

program Twinion
		  cd twinion
		  twgenn.exe
        SET NOLOAD_MUSIC	FALSE

program Twina
		  cd twinion
		  fates.exe
        SET NOLOAD_MUSIC	FALSE

program ShopAdv
		  cd shopadv
        shopadv.exe

program DummyDontRemove
