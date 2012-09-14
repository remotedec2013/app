configs ={
  :git => {
    :user => '20120917brussels',
    :remotes => potentially_change("remotes",__FILE__),
    :repo => 'app' 
  }
}
configatron.configure_from_hash(configs)
