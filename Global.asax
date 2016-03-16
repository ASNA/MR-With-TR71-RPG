<%@ Application Language="AVR" %>

<script runat="server">

    Begsr Application_Start
		dclsrparm sender type(*object)
		dclsrparm e type(System.EventArgs)

		*base.Application.Lock()
        *base.Application["ActiveJobs"] = *new System.Collections.Hashtable()
        *base.Application.UnLock()
	Endsr

	Begsr Session_Start
		dclsrparm sender type(*object)
		dclsrparm e type(System.EventArgs)

        dclfld Device type(*object)
        dclfld Job type(ASNA.Monarch.WebJob)
        dclfld ActiveJobTable type(System.Collections.Hashtable)
        dclfld fileName type(*string) inz("")
		dclfld _lock0 type(*object)

        fileName = System.IO.Path.GetFileNameWithoutExtension(*base.Request.Path)

        If (fileName.StartsWith("!") *or *base.Request.Form["__isDspF__"] <> *nothing)
            leavesr
		Endif

        If Session.IsCookieless *and isAppleMobileDevice()
            // Apple Homescreen Web Apps always start a new session (restarting the app), 
            // if we are using coockieless sessions, then we can restore the user's 
            // previous session showing the last visited screen.
            If *not *base.Request.Path.EndsWith("Monarch/iResumeFullScreen.aspx") *and *not *base.Request.Path.EndsWith("Monarch/Resumer.aspx")
                Server.Transfer("~/Monarch/iResumeFullScreen.aspx")
                leavesr
            EndIf
        EndIf

        *base.Session["Monarch_AppPath"] = Request.ApplicationPath
        *base.Session["MonarchInitiated"] = *nothing
        Job = NewJob()
        *base.Session["Job"] = Job
        Device = Job.Start(*this.Session.SessionID)
        *base.Session["Device"] = Device

        ActiveJobTable = *base.Application["ActiveJobs"] *as System.Collections.Hashtable
        _lock0 = ActiveJobTable.SyncRoot
        EnterLock Object(_lock0)
            ActiveJobTable.Add(*this.Session.SessionID + Job.PsdsJobNumber.ToString(), Job)
        ExitLock

        ReadAlternatePagesConfig()
    EndSr

    BegFunc isAppleMobileDevice type(*boolean) access(*private)
        dclfld userAgent *string
        userAgent = Request.UserAgent
        leavesr userAgent.Contains("(iP") *and userAgent.Contains("Mobile")
    EndFunc
        
    Begsr  ReadAlternatePagesConfig
        dclfld userAgent type(*string)
        dclfld alternatePagesConfigDoc type(System.Xml.Linq.XDocument)

        userAgent =  Request.UserAgent

        If userAgent = *nothing
           LeaveSr
        EndIf

        alternatePagesConfigDoc = XDocument.Load(Request.PhysicalApplicationPath + "/App_Data/AlternatePages.config")

        If alternatePagesConfigDoc = *nothing
            LeaveSr
        EndIf

        ForEach agentNode Type(XElement) Collection( alternatePagesConfigDoc.Root.Elements(XName.Get("agent")) )
            DclArray words type(*String) Rank(1)
            dclfld subfolder type(*string)

            words = agentNode.Attribute(XName.Get("contains")).Value.Split(O' ')
            subfolder = agentNode.Attribute(XName.Get("subfolder")).Value.Trim()

            ForEach word Type(*string) Collection( words )
                If Not userAgent.Contains(word.Trim())
                    subfolder = *nothing
                    leave
                EndIf
            EndFor
            
            If subfolder <> *nothing
                Session.Item("Monarch_AlternateSubfolder") = subfolder
                LeaveSr
            EndIf
        EndFor
    Endsr

    Begsr Session_End
		dclsrparm sender type(*object)
		dclsrparm e type(System.EventArgs)

        dclfld Job type(ASNA.Monarch.WebJob)
        dclfld ActiveJobTable type(System.Collections.Hashtable)
		dclfld _lock1 type(*object)

        Job = *base.Session["Job"] *as ASNA.Monarch.WebJob
		If (Job <> *nothing)
            Job.RequestShutdown(20)

            ActiveJobTable = *base.Application["ActiveJobs"] *as System.Collections.Hashtable
            _lock1 = ActiveJobTable.SyncRoot
            EnterLock Object(_lock1)
                ActiveJobTable.Remove(*this.Session.SessionID + Job.PsdsJobNumber.ToString())
            ExitLock
		Endif
	Endsr    

    BegFunc NewJob Type(ASNA.Monarch.WebJob)
        leavesr *new MrLogic.MobileRpgJob()
	EndFunc

</script>
