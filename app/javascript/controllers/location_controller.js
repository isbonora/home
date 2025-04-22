import { Controller } from "@hotwired/stimulus"
import 'leaflet'

// Connects to data-controller="location"
export default class extends Controller {
  static targets = [ "map" ]
  connect() {
    var map = L.map(this.mapTarget).setView([48.1351, 11.5820], 13);
    
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 10,
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);

    map.zoomControl.remove();
  }
}
