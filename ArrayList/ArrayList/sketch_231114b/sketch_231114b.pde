int wind = 1;
ArrayList<snow> s = new ArrayList<snow>();
int numberOfFlakes = 500;
void setup() {
  wind = 1;
  size(500, 500);
  background(0);
  noStroke();
  for (int i = 0; i < numberOfFlakes; i++)
  {
    s.add(new snow((int)random(0, 500), (int)random(0, 500), random(1, 15), (int)random(1, 255)));
  }
}

void draw() {
  background(0);
  if(random(0,1) < 0.2)
  {
    wind = (int)random(0,2);
    
  } 
  for (int i = 0; i < numberOfFlakes; i++)
  {
    snow t = s.get(i);
    t.Update();
    t.Render();
  }
}


class snow {
  PVector pos = new PVector();
  float size;
  int alpha;
  float speed;

  snow(int x, int y, float size, int a)
  {
    pos = new PVector(x, y);
    this.size = size;
    alpha = a;
    speed = (int)random(1, 5);
  }

  void Update()
  {
    pos.y += speed;
    switch (wind) {
    case 0:
      pos.x -= speed * (float)(alpha/255) ;
      break;
    case 1:
      break;
    case 2:
      pos.x += speed * (float)(alpha/255);
      break;
    default:
      break;
    }

    if (pos.y > 500 + (size/2))
    {
      pos.y = -(size/2);
      pos.x = random(0, 500);
    }
  }

  void Render()
  {
    println((float)alpha/255);
    fill(255, 255, 255, alpha);
    ellipse(pos.x, pos.y, size, size);
  }
}
