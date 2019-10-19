classdef SimpleValue
   properties
      Value
   end
   methods
      function obj = SimpleValue(v)
         if nargin > 0
            obj.Value = v;
         end
      end
      function obj = set.Value(obj,v)
          if nargin > 0
              obj.Value = v;
          end
      end
      function a = get.Value(obj)
          a = obj.Value;
      end
            
   end
end