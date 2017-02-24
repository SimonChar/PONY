actor Main
      var ping: PingPong
      var pong: PingPong

      new create(env: Env)=>
      var numPingPongs: U32 = try env.args(1).u32() else 1 end

      //Creating Ping and Pong actors
      ping = PingPong.create(numPingPongs, env.out)
      pong = PingPong.create(numPingPongs, env.out)

      //Start ping pong
      ping.ping(pong)

      env.out.print("Two actors have PingPonged each other " + numPingPongs.string() + " times!")
