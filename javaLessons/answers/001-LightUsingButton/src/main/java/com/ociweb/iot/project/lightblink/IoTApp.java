package com.ociweb.iot.project.lightblink;

import static com.ociweb.iot.grove.GroveTwig.Button;
import static com.ociweb.iot.grove.GroveTwig.LED;

import com.ociweb.iot.maker.CommandChannel;
import com.ociweb.iot.maker.DeviceRuntime;
import com.ociweb.iot.maker.Hardware;
import com.ociweb.iot.maker.IoTSetup;


public class IoTApp implements IoTSetup {
           
	 public static final int LED_PORT = 4;
	 public static final int BUTTON_PORT = 3;
	
    public static void main( String[] args) {
        DeviceRuntime.run(new IoTApp());
    }    
    
    @Override
    public void declareConnections(Hardware hardware) {
        hardware.connectDigital(LED, LED_PORT);
        hardware.connectDigital(Button, BUTTON_PORT);
    }

    @Override
    public void declareBehavior(DeviceRuntime runtime) {
        
        final CommandChannel ledChannel = runtime.newCommandChannel(); 
        
        runtime.addDigitalListener((connection,time,durationMillis, value)->{
        	
            ledChannel.digitalSetValue(5,value);
        	        	
        });
              
    }  
}

