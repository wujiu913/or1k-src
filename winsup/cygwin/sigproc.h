/* sigproc.h

   Copyright 1997, 1998, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
   2011, 2012 Red Hat, Inc.

This file is part of Cygwin.

This software is a copyrighted work licensed under the terms of the
Cygwin license.  Please consult the file "CYGWIN_LICENSE" for
details. */

#pragma once
#include <signal.h>
#include "sync.h"

#ifdef NSIG
enum
{
  __SIGFLUSH	    = -(NSIG + 1),
  __SIGSTRACE	    = -(NSIG + 2),
  __SIGCOMMUNE	    = -(NSIG + 3),
  __SIGPENDING	    = -(NSIG + 4),
  __SIGDELETE	    = -(NSIG + 5),
  __SIGFLUSHFAST    = -(NSIG + 6),
  __SIGHOLD	    = -(NSIG + 7),
  __SIGNOHOLD	    = -(NSIG + 8),
  __SIGEXIT	    = -(NSIG + 9),
  __SIGSETPGRP	    = -(NSIG + 10)
};
#endif

#define SIG_BAD_MASK (1 << (SIGKILL - 1))

enum procstuff
{
  PROC_ADDCHILD		  = 1,	// add a new subprocess to list
  PROC_REATTACH_CHILD	  = 2,	// reattach after exec
  PROC_EXEC_CLEANUP	  = 3,	// cleanup waiting children after exec
  PROC_DETACHED_CHILD	  = 4,	// set up a detached child
  PROC_CLEARWAIT	  = 5,	// clear all waits - signal arrived
  PROC_WAIT		  = 6,	// setup for wait() for subproc
  PROC_EXECING		  = 7,	// used to get a lock when execing
  PROC_NOTHING		  = 8	// nothing, really
};

struct sigpacket
{
  siginfo_t si;
  pid_t pid;
  class _cygtls *tls;
  sigset_t *mask;
  union
  {
    HANDLE wakeup;
    HANDLE thread_handle;
    struct sigpacket *next;
  };
  int __stdcall process () __attribute__ ((regparm (1)));
  int setup_handler (void *handler, struct sigaction& siga, _cygtls *tls)
    __attribute__ ((regparm (3)));
};

void __stdcall sig_dispatch_pending (bool fast = false)
  __attribute__ ((regparm (1)));
void set_signal_mask (sigset_t&, sigset_t) __attribute__ ((regparm (2)));
int __stdcall handle_sigprocmask (int sig, const sigset_t *set,
				  sigset_t *oldset, sigset_t& opmask)
  __attribute__ ((regparm (3)));

void __stdcall sig_clear (int) __attribute__ ((regparm (1)));
void __stdcall sig_set_pending (int) __attribute__ ((regparm (1)));
int __stdcall handle_sigsuspend (sigset_t);

int __stdcall proc_subproc (DWORD, DWORD) __attribute__ ((regparm (2)));

class _pinfo;
void __stdcall proc_terminate ();
void __stdcall sigproc_init ();
#ifdef __INSIDE_CYGWIN__
void __stdcall sigproc_terminate (enum exit_states);
#endif
bool __stdcall pid_exists (pid_t) __attribute__ ((regparm(1)));
int __stdcall sig_send (_pinfo *, siginfo_t&, class _cygtls *tls = NULL) __attribute__ ((regparm (3)));
int __stdcall sig_send (_pinfo *, int) __attribute__ ((regparm (2)));
void __stdcall signal_fixup_after_exec ();
void __stdcall sigalloc ();

int kill_pgrp (pid_t, siginfo_t&);
int killsys (pid_t, int);

extern "C" void sigdelayed ();

extern char myself_nowait_dummy[];

extern struct sigaction *global_sigs;

class lock_signals
{
  bool worked;
public:
  lock_signals ()
  {
    worked = sig_send (NULL, __SIGHOLD) == 0;
  }
  operator int () const
  {
    return worked;
  }
  void dont_bother ()
  {
    worked = false;
  }
  ~lock_signals ()
  {
    if (worked)
      sig_send (NULL, __SIGNOHOLD);
  }
};

class lock_pthread
{
  bool bother;
public:
  lock_pthread (): bother (1)
  {
    pthread::atforkprepare ();
  }
  void dont_bother ()
  {
    bother = false;
  }
  ~lock_pthread ()
  {
    if (bother)
      pthread::atforkparent ();
  }
};

class hold_everything
{
  bool ischild;
  /* Note the order of the locks below.  It is important,
     to avoid races, that the lock order be preserved.

     pthread is first because it serves as a master lock
     against other forks being attempted while this one is active.

     signals is next to stop signal processing for the duration
     of the fork.

     process is last.  If it is put before signals, then a deadlock
     could be introduced if the process attempts to exit due to a signal. */
  lock_pthread pthread;
  lock_signals signals;
  lock_process process;

public:
  hold_everything (bool x = false): ischild (x) {}
  operator int () const {return signals;}

  ~hold_everything()
  {
    if (ischild)
      {
	pthread.dont_bother ();
	process.dont_bother ();
	signals.dont_bother ();
      }
  }

};

#define myself_nowait ((_pinfo *) myself_nowait_dummy)
