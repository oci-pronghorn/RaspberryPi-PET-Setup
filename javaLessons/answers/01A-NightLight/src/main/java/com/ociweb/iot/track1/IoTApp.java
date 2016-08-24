package com.ociweb.iot.track1;


import static com.ociweb.iot.grove.GroveTwig.AngleSensor;
import static com.ociweb.iot.grove.GroveTwig.LightSensor;

import com.ociweb.iot.grove.Grove_LCD_RGB;
import com.ociweb.iot.maker.CommandChannel;
import com.ociweb.iot.maker.DeviceRuntime;
import com.ociweb.iot.maker.Hardware;
import com.ociweb.iot.maker.IoTSetup;

import static com.ociweb.iot.maker.Port.A2;
import static com.ociweb.iot.maker.Port.A1;


/**
 * As it gets dark the back light of the LCD comes on.
 * Angle sensor is used for brightness adjustment
 */

public class IoTApp implements IoTSetup
{
	int brightness;
	
    public static void main( String[] args ) {
        DeviceRuntime.run(new IoTApp());
    }
    
    
    @Override
    public void declareConnections(Hardware c) {
    	
    	c.connect(LightSensor, A2);
    	c.connect(AngleSensor, A1);
    	c.useI2C();
    }


    @Override
    public void declareBehavior(DeviceRuntime runtime) {
        
        	
    	final CommandChannel commandChannel = runtime.newCommandChannel();
    	runtime.addAnalogListener((port, time, durationMillis, average, value)->{
 
    		switch(port) {
	    		case A2:
	    			
	    		    //will be assigned 32 when the room is dark
	    		    //will be assigned 22 when the room is light
	    			int leadingZeros =  Integer.numberOfLeadingZeros(value);
	    			
	    			//will be assigned 10 when the room is dark
	    			//will be assigned 0 when the room is light
	    			int darknessValue = leadingZeros-22;
	    			
	    			int level = Math.min(255, (brightness * darknessValue )/10);

	    			Grove_LCD_RGB.commandForColor(commandChannel, level, level, level);	    			
	    				    			
	    			break;
	    		
	    		case A1:	    			
	    			
	    		    brightness = ((AngleSensor.range()/2) * value)/AngleSensor.range();    	
	    			
	    			break;	    		
    		
    		}    		
    		
    	});
    	
    }        
  
}
