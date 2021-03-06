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

import org.mixim.base.modules.IMobility;
import org.mixim.base.modules.IBaseApplLayer;
import org.mixim.modules.nic.Nic80211p;
import org.mixim.modules.application.ieee80211p.TestWaveApplLayer;

module Host80211p
{
    parameters:

        //string mobilityType = default("BonnMotionMobility");
        //string mobilityType = default("RandomWPMobility");
          string applicationType = default("TestWaveApplLayer");
        string mobilityType = default("LinearMobility");
        @display("i=device/router");

    gates:
        input radioIn;

    submodules:
        nic: Nic80211p {
            parameters:
                @display("p=37,87;i=block/wrxtx,#008000");
        }
        appl: <applicationType> like IBaseApplLayer {
            parameters:
                @display("p=122,87;i=app");
        }
        mobility: <mobilityType> like IMobility {
            parameters:
                @display("p=76,159;i=block/cogwheel");
        }


    connections allowunconnected:
        nic.upperLayerOut --> appl.lowerLayerIn;
        nic.upperLayerIn <-- appl.lowerLayerOut;
        nic.upperControlOut --> { @display("ls=red;m=m,70,0,70,0"); } --> appl.lowerControlIn;
        nic.upperControlIn <-- { @display("ls=red;m=m,70,0,70,0"); } <-- appl.lowerControlOut;

        radioIn --> nic.radioIn;
}
