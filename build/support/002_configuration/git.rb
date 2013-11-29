configs ={
  :git => {
    :user => 'remotedec2013',
    :remotes => potentially_change("remotes",__FILE__),
    :repo => 'app' 
  }
}
configatron.configure_from_hash(configs)
