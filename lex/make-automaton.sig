
signature MAKE_AUTOMATON =
   sig

      type action = int * string

      (* makeAutomaton alphabet-size armcount Rs

         if    |Rs| = armcount
         then  (Q, q_init, Q_final, delta) is a dfa for Rs
               Q = { 0 .. count-1 }
               q_init in Q
               Q_final = { 1 .. lastfinal }
               0 is a sink state (ie, delta(0) is empty)
               trans = [ a_0 .. a_count-1 ]
               for i = 0 .. count-1 . a_i = [ delta(i, 0) .. delta(i, charLimit-1) ]
               finals = [ action(1) .. action(lastfinal) ]
               NB: finals is missing entry 0
               redundancies is the list of all arms that were not used
               b iff Rs is inexhaustive
               and
               return ((count, q_init, lastfinal, finals, trans), redundancies, b)
      *)
      val makeAutomaton : int -> int -> (Regexp.regexp * action) list -> Automata.automaton * int list * bool

   end
