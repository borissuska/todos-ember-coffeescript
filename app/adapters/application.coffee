`import DS from 'ember-data'`;

# Adapter = DS.FixtureAdapter.extend();

Adapter =  DS.LSAdapter.extend
  namespace: 'todos-coffe-emberjs'

`export default Adapter`;
