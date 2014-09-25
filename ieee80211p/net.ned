//
// Copyright (C) 2011 David Eckhoff <eckhoff@cs.fau.de>
//
// Documentation for these modules is at http://veins.car2x.org/
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//

//package org.mixim.examples.ieee80211p;

package wirelessproj.ieee80211p;

import org.mixim.base.modules.BaseNetwork;
import org.mixim.base.modules.BaseWorldUtility;


//
// TODO auto-generated module
//
network net extends BaseNetwork
{
    parameters:
        int numCars;
        int numStations;

        @display("bgb=1100,800;bgl=2");
        @display("bgi=background/matrix");
    submodules:
        car[numCars]: Host80211p {
            @display("p=127,142");
        }
        station[numStations]: RSU {
            @display("p=248,142");
        }

    connections allowunconnected:
    // all connections and gates are to be generated dynamically
}
