library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Up_Dn_counter is
  port (
        clk : in std_logic;--1Mhz clock 
        rst : in std_logic;--reset input
        up : in std_logic;
        down : in std_logic;
        C_out : out std_logic_vector(9 downto 0) 
       );
end Up_Dn_counter;

architecture behavioral of Up_Dn_counter is
signal s_C_out : std_logic_vector(c_out'range);
begin
    process(clk,rst)
    begin
      if(rst='1')then
				s_C_out <= (others =>'0');
      elsif (clk'event and clk ='1') then
      	if (up xor down) then
		      if (down ='1'and s_C_out /=(s_C_out'range => '0')) then
		    		s_C_out <= s_C_out - 1;
		    	elsif (up = '1' and s_C_out /=(s_C_out'range => '1')) then
		    		s_C_out <= s_C_out + 1;
		    	end if;
		    end if;
      end if;
    end process;
    C_out <= s_C_out;
end behavioral;

